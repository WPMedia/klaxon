# Adding your org's logo to the app

Adding a logo is simple! At the top left of the app, there is the Klaxon logo and name. If you save your logo as `app/assets/images/logo.svg` in your repository, the top left will display as `Klaxon for {your logo}`.

If you are running the app in Docker, you will need to rebuild your Docker container to recompile the static assets like so:

```
docker-compose down
docker-compose build
docker-compose up
```