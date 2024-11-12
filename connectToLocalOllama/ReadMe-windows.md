# How to connect to ollama local llm from docker?
Reference: [ollama FAQ](https://github.com/ollama/ollama/blob/main/docs/faq.md)
## Step1 Change the ollama host url from localhost to your local url:
1. close running ollama
2. open System Properties and edit Environmemt Variables
3. Add new user variables :\
    Variable name: OLLAMA_HOST\
    Variable value: http://your_ip:11434\
    hint: you can use ipconfig to find your ip
4. restart ollama

## Step2 docker run command
1. use the following command to get the image from docker hub: 

       docker pull ggaryyy/ollama-local-test:latest 

2. use the following docker command to run the image

       docker run -p 11434:11434 --add-host=host.docker.internal:host-gateway -it --rm -v your_folder/:/app ggaryyy/ollama-local-test:latest bash

## Step3 Test is the connect success or not
Now you enter the interactive mode.\
And enter:
    
    curl http://your_ip:11434

it should return **Ollama is running** 

## Step4 try to get response from local llm
run ollama-local-connect.py to get the local llm response