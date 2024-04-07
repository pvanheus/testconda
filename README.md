This is a Dockerized test of the bug reported [here](https://github.com/bactopia/bactopia/issues/502)

To reproduce:

```bash
docker build -t testconda . && docker run --rm testconda
```

(This creates a `testconda` Docker image that you will want to delete (`docker rmi testconda`) after confirming the issue)