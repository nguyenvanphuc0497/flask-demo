venv:
	@srouce venv/bin/activate
	@python -V

requirement: venv
	@pip freeze
	@pip freeze > requirements.txt

run: venv
	@export FLASK_APP=flaskr
	@export FLASK_ENV=development
	@flask run

init_db:venv
	@flask init-db

setup:venv
	@pip install -r requirements.txt

clean:venv
	@pip uninstall -r requirements.txt

env_show: venv
	@echo ${FLASK_APP}
	@echo ${FLASK_ENV}

make_installable:
	@pip install -e .
