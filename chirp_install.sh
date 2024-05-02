sudo apt install git python3-wxgtk4.0 python3-serial python3-six python3-future python3-requests python3-pip -y
wget https://archive.chirpmyradio.com/chirp_next/next-20240427/chirp-20240427-py3-none-any.whl
pip install ./chirp-20240427-py3-none-any.whl
sudo sed -i '/DigiPi Plus/a \        "CHIRP"               f.exec "chirp &"' /home/pi/.emwmrc