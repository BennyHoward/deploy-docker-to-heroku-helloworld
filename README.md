# Deploy Docker to Heroku Hello World

A simple example of how to deploy a docker container to Heroku.  This is based on the [Heroku Alpine Hello World](https://github.com/heroku/alpinehelloworld) example repo.  

For educational purposes only.  

## Motivation

*In this section, you can describe your "why" for building this project.*  
*This will help potential contributors understand how they can best assist the project achieve it's goals.*  

## Author(s)

- [author's name here](mailto:author.email@) (Author role)  
  For questions and requests email this contact.  
- ...other authors

## License

This project is licensed under the ISC license.  

*Refer to [LICENSE](./LICENSE) for the license.*  

## Requirements

- list of your requirements
- ...more requirements

## Contributing

*No contributions will be accepted in this repo.*  

## Development Environment Setup

### Install Homebrew

### Use Homebrew to Install Heroku CLI Tool

```sh
brew tap heroku/brew && brew install heroku
```

### Register an Account on Heroku

***TODO***

## Bootstrapping the Project

### Log Into Heroku

```sh
heroku login -i
```

You'll be asked you email and password you use to login as if you were using the browser.  

### Log Into Heroku Container Registry

```sh
heroku container:login
```

**NOTE**: Yes you will be logging in twice.  First into Heroku itself, then into the container registry.    

### Create Heroku Application

```sh
heroku create
```

This will generate a Heroku app with a Heroku URL where the application will be deployed.  
It usually of the pattern `https://<some-random-name>.herokuapp.com`.  
**WARNING**: Remember the generated app name.  You'll need this for later steps such as deployment.  

## Usage

### Build Docker Image

```sh
docker build -t deploy-docker-to-heroku-helloworld .
```

### Run Docker Container Locally

```sh
docker run --rm --detach --publish 8000:8000 --env PORT=8000 --name deploy-docker-to-heroku-helloworld deploy-docker-to-heroku-helloworld
```

### Stop Locally Running Docker

```sh
docker stop deploy-docker-to-heroku-helloworld
```

### Build Docker Image in Heroku and Load into the Heroku Container Registry

Where `$HEROKU_APP_NAME` is the name of the app generated when you ran [`heroku create`](#create-heroku-application).  

```sh
heroku container:push web --app $HEROKU_APP_NAME
```

This is basically the same as the `docker build ...` command that you ran to build your container locally, but this time in Heroku.  

### Release the Docker Image to the Generated App URL

```sh
heroku container:release web --app $HEROKU_APP_NAME
```

### Destroy Docker

```sh
heroku apps:destroy $HEROKU_APP_NAME --confirm $HEROKU_APP_NAME
```

## References

- [Heroku Deployment Methods: 3/3](https://youtu.be/CWhDrljJMSs)
