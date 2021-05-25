
FROM rocker/rstudio:4.0.5
RUN apt-get update \
	&& apt-get install -y build-essential libz-dev libxml2 libcairo2-dev libxt-dev libnode-dev libmagick++-6.q16-dev \
	&& wget http://ftp.gnu.org/gnu/glpk/glpk-5.0.tar.gz && tar -xzvf glpk-5.0.tar.gz && cd glpk-5.0 && ./configure && make && make install \
	&& R -e "install.packages(c('BiocManager','tidyverse','optparse','picante','ggthemes','ggdendro','ggrepel','cowplot','Cairo','randomForest','randomcoloR','pheatmap','gridExtra','viridis','ggalluvial','ggimage','ggpubr','rprojroot','remotes','agricolae','captioner','pander','PerformanceAnalytics','psych','shinydashboard','dashboardthemes'))" \
	&& R -e "BiocManager::install(c('phyloseq','ggtree','metagenomeSeq','htmlwidgets','knitr'))" \
	&& R -e "remotes::install_github('MadsAlbertsen/ampvis2')" \
	&& R -e "remotes::install_github('yiluheihei/microbiomeMarker')" \
	&& R -e "remotes::install_github('kylebittinger/qiimer')" \
	&& R -e "remotes::install_github('joey711/biom')" \
	&& wget http://tax4fun.gobics.de/Tax4Fun/Tax4Fun_0.3.1.tar.gz \
	&& R -e "install.packages('./Tax4Fun_0.3.1.tar.gz',repos=NULL,type='source')"



