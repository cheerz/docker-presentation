## Prerequisite
### Docker for mac
Follow [instructions](https://docs.docker.com/docker-for-mac/install/), it contains all dependencies
### Docker for linux
<details><summary>For Ubuntu:</summary>
<p>
<ul>
<li>
  <a href="https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions">Uninstall old versions</a>
</li>
<li>
  <a href="https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository">Install using the repository</a>
</li>
<li>

 Add to your using the right to use Docker
  ```bash
  sudo usermod -aG docker <YOUR-USERNAME>
  ```
</li>
</ul>

</p>
</details>
<details><summary>For Debian:</summary>
<p>
<ul>
<li>
  <a href="https://docs.docker.com/engine/install/debian/#uninstall-old-versions">Uninstall old versions</a>
</li>
<li>
  <a href="https://docs.docker.com/engine/install/debian/#install-using-the-repository">Install using the repository</a>
</li>
<li>

 Add to your using the right to use Docker
  ```bash
  sudo usermod -aG docker <YOUR-USERNAME>
  ```
</li>
</ul>

</p>
</details>
<details><summary>For Centos:</summary>
<p>
<ul>
<li>
  <a href="https://docs.docker.com/engine/install/centos/#uninstall-old-versions">Uninstall old versions</a>
</li>
<li>
  <a href="https://docs.docker.com/engine/install/centos/#install-using-the-repository">Install using the repository</a>
</li>
<li>

 Add to your using the right to use Docker
  ```bash
  sudo usermod -aG docker <YOUR-USERNAME>
  ```
</li>
</ul>

</p>
</details>
<details><summary>For Fedora:</summary>
<p>
<ul>
<li>
  <a href="https://docs.docker.com/engine/install/fedora/#uninstall-old-versions">Uninstall old versions</a>
</li>
<li>
  <a href="https://docs.docker.com/engine/install/fedora/#install-using-the-repository">Install using the repository</a>
</li>
<li>

 Add to your using the right to use Docker
  ```bash
  sudo usermod -aG docker <YOUR-USERNAME>
  ```
</li>
</ul>

</p>
</details>

### Docker-compose for Linux
Follow [instructions](https://docs.docker.com/compose/install/#install-compose-on-linux-systems) in the linux tab.

## Make changes
Just edit presentation.md to update presentation

## Apply more advanced changes
That repository was created only to use original layout, to change it please refer to [original repository](https://github.com/theodorosploumis/docker-presentation).

## Start presenting
Just type `make start` and open http://127.0.0.1:8080 in your browser.

## All available commands
* `make build` => Build image
* `make run` => Run the container from the image
* `make clean` => Stop and rm container
* `make start` => `make build` + `make run`
* `make update` => `make clean` + `make build` + `make run`
* `make restart` => `make clean` + `make run`


________________________


## Credit

#### [Python Meetup Thessaloniki](http://www.meetup.com/PyThess/), 15 April 2016

###### [TheodorosPloumis.com](http://www.theodorosploumis.com/en) / [@theoploumis](http://twitter.com/theoploumis)

###### Get them: [online presentation](http://theodorosploumis.github.io/docker-presentation/) / [source code](https://github.com/theodorosploumis/docker-presentation) / [docker image](https://hub.docker.com/r/tplcom/docker-presentation/)

###### Under [Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/) license.

