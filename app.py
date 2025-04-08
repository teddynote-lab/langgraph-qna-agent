from fastapi import FastAPI, status
from fastapi.responses import JSONResponse
import uvicorn

app = FastAPI(title="Health Check Server", description="A simple health check server")


@app.get("/health", status_code=status.HTTP_200_OK)
async def health_check():
    """
    Health check endpoint that returns a 200 OK status.

    Returns:
        JSONResponse: A JSON response with status information
    """
    return JSONResponse(
        status_code=status.HTTP_200_OK,
        content={"status": "healthy", "service": "health-check-server"},
    )


@app.get("/", status_code=status.HTTP_200_OK)
async def root_health_check():
    """
    Root health check endpoint that returns a 200 OK status.
    This can be used as an alternative to the /health endpoint.

    Returns:
        JSONResponse: A JSON response with status information
    """
    return JSONResponse(
        status_code=status.HTTP_200_OK,
        content={"status": "healthy", "service": "health-check-server"},
    )


if __name__ == "__main__":
    port = 7777  # 포트 번호를 7777로 변경
    print(f"Starting health check server on port {port}...")
    uvicorn.run(app, host="0.0.0.0", port=port)
