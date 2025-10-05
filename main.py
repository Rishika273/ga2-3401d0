from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"status": "ok", "msg": "deployment-ready-ga2-3401d0"}

@app.get("/healthz")
def health():
    return {"status": "healthy"}
