import time

async def log_request(
    request,
    call_next
):

    start = time.time()

    response = await call_next(request)

    end = time.time()

    print(
        request.method,
        request.url.path,
        response.status_code,
        round(end - start, 4)
    )

    return response