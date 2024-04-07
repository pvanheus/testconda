This is a Dockerized test of the bug reported [here](https://github.com/bactopia/bactopia/issues/502)

To reproduce:

```bash
docker build -t testconda . && docker run --rm testconda
```

(This creates a `testconda` Docker image that you will want to delete (`docker rmi testconda`) after confirming the issue)

#### Demo run

```bash
$ docker build -t testconda . && docker run --rm testcondada
[+] Building 0.1s (11/11) FINISHED                                                                       docker:default
 => [internal] load build definition from Dockerfile                                                               0.0s
 => => transferring dockerfile: 525B                                                                               0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04                                                    0.0s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [1/6] FROM docker.io/library/ubuntu:22.04                                                                      0.0s
 => [internal] load build context                                                                                  0.0s
 => => transferring context: 34B                                                                                   0.0s
 => CACHED [2/6] RUN apt update && apt install -y wget                                                             0.0s
 => CACHED [3/6] RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_  0.0s
 => CACHED [4/6] RUN adduser --home /home/conda --shell /bin/bash --uid 1000 --disabled-password --gecos "" conda  0.0s
 => CACHED [5/6] COPY --chown=conda:conda testconda.sh /home/conda/testconda.sh                                    0.0s
 => CACHED [6/6] WORKDIR /home/conda                                                                               0.0s
 => exporting to image                                                                                             0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:e1990c56c9e0ae85d67e0cd4d5acdc8714676a2b5dda9c5491665c537ea2968a                       0.0s
 => => naming to docker.io/library/testconda                                                                       0.0s

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
Warning: 'conda-forge' already in 'channels' list, moving to the top
Loading channels: ...working... done
# Name                       Version           Build  Channel
perl-bioperl                   1.7.2        pl526_11  bioconda
Loading channels: ...working... done
# Name                       Version           Build  Channel
prokka                        1.14.6 pl5262hdfd78af_3  bioconda
Channels:
 - conda-forge
 - bioconda
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): ...working... done
Solving environment: ...working... warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
warning  libmamba Problem type not implemented SOLVER_RULE_STRICT_REPO_PRIORITY
failed

LibMambaUnsatisfiableError: Encountered problems while solving:
  - package perl-bioperl-1.7.2-pl526_11 requires perl-bio-coordinate, but none of the providers can be installed

Could not solve for environment specs
The following packages are incompatible
├─ perl-bioperl ==1.7.2 pl526_11 is not installable because it requires
│  ├─ perl >=5.26.2,<5.26.3.0a0 , which can be installed;
│  └─ perl-bio-coordinate but there are no viable options
│     ├─ perl-bio-coordinate 1.007001 would require
│     │  └─ perl-parent but there are no viable options
│     │     ├─ perl-parent [0.236|0.238|0.239|0.240|0.241] would require
│     │     │  └─ perl >=5.32.1,<6.0a0 *_perl5, which conflicts with any installable versions previously reported;
│     │     └─ perl-parent 0.236 conflicts with any installable versions previously reported;
│     └─ perl-bio-coordinate 1.007001 would require
│        └─ perl >=5.32.1,<6.0a0 *_perl5, which conflicts with any installable versions previously reported;
└─ prokka ==1.14.6 pl5262hdfd78af_3 is not installable because it requires
   └─ perl-xml-simple but there are no viable options
      ├─ perl-xml-simple 2.22 would require
      │  └─ perl >=5.22.0,<5.23.0 , which conflicts with any installable versions previously reported;
      ├─ perl-xml-simple [2.22|2.25] would require
      │  └─ perl-xml-sax-expat but there are no viable options
      │     ├─ perl-xml-sax-expat 0.51 would require
      │     │  └─ perl >=5.32.1,<6.0a0 *_perl5, which conflicts with any installable versions previously reported;
      │     └─ perl-xml-sax-expat 0.51 conflicts with any installable versions previously reported;
      └─ perl-xml-simple 2.25 would require
         └─ perl >=5.32.1,<6.0a0 *_perl5, which conflicts with any installable versions previously reported.
```

