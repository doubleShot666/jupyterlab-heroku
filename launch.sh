#jupyter serverextension enable --py jupyterlab --sys-prefix

#mkdir -p root
#cd root

#cp ../kernel.cpython-37m-x86_64-linux-gnu.so ./kernel.cpython-37m-x86_64-linux-gnu.so
#cp ../test_hapke.json ./test_hapke.json
#cp ../test_script.ipynb ./test_script.ipynb


#export JUPYTER_CONFIG_DIR=/app
#jupyter lab --port=${PORT}

curl -sSL https://get.docker.com/ | sh

docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

docker run -d --name gitlab-runner --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --volumes-from gitlab-runner-config \
    gitlab/gitlab-runner:latest
