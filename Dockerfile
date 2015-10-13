FROM centos:centos7

# Update System Image and install EPEL
RUN \
  yum update -y && \
  yum upgrade -y && \
  yum install -y epel-release

# Install R
RUN \
  yum install -y R
  
#install additional tools and library prerequisites
RUN \
  yum install -y netcdf-devel
  
# Setup default cran repo
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile


# This installs other R packages under Bioconductor
RUN Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('mzR')"


CMD "/bin/bash"
