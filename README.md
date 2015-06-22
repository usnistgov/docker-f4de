# docker-f4de
Dockerfile for F4DE

Helps install a Ubuntu 14.04 with the needed tools, install and test F4DE

**To Build**:
In the directory where this `Dockerfile` is:
`% docker build .`

**To Use**:
Adapt <IMAGENAME> and directories:
`% docker run -t -i -v <INDIR>:/f4de_indir:ro -v <OUTDIR>:/f4de_outdir <IMAGENAME> /bin/bash`

**LICENSE**:

Full details can be found at: http://nist.gov/data/license.cfm

This software was developed at the National Institute of Standards and Technology by employees and/or contractors of the Federal Government in the course of their official duties.
Pursuant to Title 17 Section 105 of the United States Code this software is not subject to copyright protection within the United States and is in the public domain.

"docker-f4de" is an experimental system.
NIST assumes no responsibility whatsoever for its use by any party.

THIS SOFTWARE IS PROVIDED "AS IS."  With regard to this software, NIST MAKES NO EXPRESS OR IMPLIED WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE.