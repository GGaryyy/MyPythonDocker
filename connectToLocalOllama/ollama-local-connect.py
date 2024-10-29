import ollama

client = ollama.Client(host="http://your_ip:11434")

prompt = input("What is your problem?:")
model = "llama3.1"

response = client.generate(model=model, prompt=prompt)

print(f"prompt: {prompt}\n"
      f"llm model use: {response['model']}\n"
      f"llm response: {response['response']}")
