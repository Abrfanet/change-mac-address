# Change Mac address as service

## Description

This tool will change the Mac Address of your system as service in every hour 

#### It is built for Ubuntu. However you can use it in any ubuntu based linux distro also in the free time we develop for centos and all linux base distro, not shy we access pull request for this repo :)

## Disclaimer

##### This scripts use default os envs and THIS IS NOT DANGROUSLY FOR YOUR SYSMTEM

#### Keep running the script in Background. It will reset your MAC every hour

## Requirements

Nothing for now


## Usage

#### Open Terminal and type/paste the following commands
1. Clone the directory to your comuter
```
git clone https://github.com/Abrfanet/change-mac-address.git
```

2. Go into the cloned Directory
```
cd change-mac-address
```

3. Run the program and escape from nasty hackers (OPTIONAL)

    - Prompt Mode : Just Enter The Details asked in the prompt 

      ``` sudo sh ./change_mac.sh YOUR_INTERFACE_NAME```

4. Copy service and service timer to systemd(Because we need to run this script in background )
     ``` sudo cp change_mac.service change_mac.timer /etc/systemd/system/```
5. Tell to ubuntu you have new change in services
    ```sudo systemctl daemon-reload```
6. Enable the timer to start at boot:
   ```sudo systemctl enable change_mac.timer```
7. Start service for now
   ```sudo systemctl start change_mac.timer```

#### Made by [abrfa.net security group](https://abrfa.net)
