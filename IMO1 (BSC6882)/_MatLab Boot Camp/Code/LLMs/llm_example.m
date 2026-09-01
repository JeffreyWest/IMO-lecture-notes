clc;clear;close all;

loadenv(".env")

model = openAIChat( ...
    "You are a helpful assistant.", ...
    ModelName="gpt-4o-mini");

prompt = "What is Model-Based Design?";

response = generate(model, prompt);

disp("--- OpenAI Response ---")
disp(response)


