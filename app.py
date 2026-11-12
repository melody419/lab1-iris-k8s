"""Lab 1 - Step 3: FastAPI predictor wrapping model.pkl."""
import joblib
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()
model = joblib.load("model.pkl")


class Req(BaseModel):
    instances: list[list[float]]


@app.post("/predict")
def predict(req: Req):
    y = model.predict(req.instances)
    return {"predictions": y.tolist()}


@app.get("/healthz")
def healthz():
    return {"ok": True}
