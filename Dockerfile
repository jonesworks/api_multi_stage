FROM apisecond

# this works, installing additional libraries...
RUN R -e 'install.packages(c("palmerpenguins"))'

COPY simpler_api.R /app

# plumb and run server
EXPOSE 8080
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/app/simpler_api.R'); pr$run(host='0.0.0.0', port=8080, swagger=TRUE)"]