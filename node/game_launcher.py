#!/usr/bin/env python3

import shlex
import subprocess
import sys
from pathlib import Path

import yaml


CONFIG_PATH = Path("/home/pi/digipi_plus/node/games.yaml")


def load_config(path: Path) -> dict:
    with path.open("r", encoding="utf-8") as f:
        data = yaml.safe_load(f) or {}

    if not isinstance(data, dict):
        raise ValueError("Top-level YAML config must be a mapping")

    data.setdefault("title", "Game Launcher")
    data.setdefault("prompt", "Select a game:")
    data.setdefault("exit_option", True)
    data.setdefault("games", [])

    if not isinstance(data["games"], list):
        raise ValueError("'games' must be a list")

    return data


def pause() -> None:
    print("\r\nPress Enter to return to the menu...", end="", flush=True)
    try:
        input()
    except EOFError:
        pass


def print_menu(config: dict) -> None:
    print("\r\n" + "=" * 40)
    print(f" {config['title']}")
    print("=" * 40 + "\r\n")

    for game in config["games"]:
        key = str(game.get("key", "")).strip()
        name = str(game.get("name", "Unnamed Game")).strip()
#        desc = str(game.get("description", "")).strip()

        print(f"{key}. {name}")
#        if desc:
#            print(f"   {desc}")
#        print()

    if config.get("exit_option", True):
        print()
        print("Q. Quit\r\n")


def find_game(config: dict, choice: str) -> dict | None:
    for game in config["games"]:
        if str(game.get("key", "")).strip().lower() == choice.lower():
            return game
    return None


def run_game(game: dict) -> None:
    name = str(game.get("name", "Unnamed Game"))
    command = str(game.get("command", "")).strip()

    if not command:
        print(f"\r\nGame '{name}' has no command configured.")
        pause()
        return

    print(f"\r\nLaunching {name}...\r\n")

    try:
        subprocess.run(shlex.split(command), check=False)
    except FileNotFoundError:
        print("Command not found.")
    except Exception as exc:
        print(f"Error launching game: {exc}")

    pause()


def main() -> int:
    try:
        config = load_config(CONFIG_PATH)
    except Exception as exc:
        print(f"Failed to load config: {exc}")
        return 1

    while True:
        print_menu(config)

        try:
            choice = input(f"{config['prompt']} ").strip()
        except EOFError:
            print()
            return 0

        if not choice:
            continue

        if config.get("exit_option", True) and choice.lower() == "q":
            print("\r\nGoodbye.\r\n")
            return 0

        game = find_game(config, choice)
        if game is None:
            print("\r\nInvalid choice.")
            pause()
            continue

        run_game(game)


if __name__ == "__main__":
    raise SystemExit(main())
