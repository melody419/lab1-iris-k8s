FROM python:3.12-slim
WORKDIR /app
# Pin scikit-learn/joblib to the versions used in train.py so model.pkl unpickles cleanly
RUN pip install --no-cache-dir fastapi uvicorn scikit-learn==1.9.1 joblib==1.6.0
COPY model.pkl app.py ./
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
