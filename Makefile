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

clean: venv
	@pip uninstall -r requirements.txt

env_show: venv
	@echo ${FLASK_APP}
	@echo ${FLASK_ENV}

make_installable:
	@pip install -e .

TEST_SETUP_FILE = setup.cfg
config_pytest: venv
	@#pip install pytest coverage
	@echo '---Create ${TEST_SETUP_FILE} file'
	@[ -f '${TEST_SETUP_FILE}' ] || touch ${TEST_SETUP_FILE}
	@echo '[tool:pytest]' > ${TEST_SETUP_FILE}
	@echo 'testpaths = tests\n' >> ${TEST_SETUP_FILE}
	@echo '[coverage:run]' >> ${TEST_SETUP_FILE}
	@echo 'branch = True' >> ${TEST_SETUP_FILE}
	@echo 'source =\n\tflaskr' >> ${TEST_SETUP_FILE}
	@cat ${TEST_SETUP_FILE}

pytest: venv
	@coverage run -m pytest
	@echo '---Run report---'
	@coverage report
	@echo '---Exported repost to html done!---'
	@coverage html
