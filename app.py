from fastapi import FastAPI
from pydantic import BaseModel
from llama_cpp import Llama
from typing import Optional

app = FastAPI()

class GenerationRequest(BaseModel):
    prompt: str
    max_tokens: Optional[int] = 256
    temperature: Optional[float] = 0.7
    top_p: Optional[float] = 0.9

# Load GGUF model from volume
llm = Llama(
    model_path="/models/unsloth.Q8_0.gguf",
    n_gpu_layers=48,   # Disesuaikan dengan VRAM
    n_ctx=2048,
    n_threads=4,
    n_batch=512,
    verbose=True
)

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.post("/generate")
async def generate(request: GenerationRequest):
    response = llm.create_completion(
        prompt=request.prompt,
        max_tokens=request.max_tokens,
        temperature=request.temperature,
        top_p=request.top_p
    )
    return {"response": response['choices'][0]['text']}
