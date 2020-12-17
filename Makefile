venv:
	@. venv/bin/activate

requirement: venv
	@pip freeze
	@pip freeze > requirements.txt

run: venv
	@export FLASK_APP=flaskr
	@export FLASK_ENV=development
	@flask run

init_db:venv
	@flask init-db
