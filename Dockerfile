# Use the official R Shiny image
FROM rocker/shiny:latest

# Install necessary R packages (modify as needed)
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"

# Copy the app into the container
COPY app.R /srv/shiny-server/

# Expose port 3838 (Shiny's default port)
EXPOSE 3838

# Set permissions and start the Shiny server
CMD ["/usr/bin/shiny-server"]
