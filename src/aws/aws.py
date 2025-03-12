import subprocess
import os

TERRAFORM_DIR = os.path.join(os.path.dirname(__file__), "../commands/{group}/terraform")


def run_terraform_command(group, command, variables=None):
    command_list = ["terraform"] + command.split()

    if variables:
        for key, value in variables.items():
            command_list.append(f"-var={key}={value}")

    print(f"Running: {' '.join(command_list)} in {TERRAFORM_DIR.format(group=group)}")

    try:
        result = subprocess.run(
            command_list, cwd=TERRAFORM_DIR.format(group=group), capture_output=True, text=True, check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"CalledProcessError executing Terraform command: {e.stderr}")
        return False
    except Exception as e:
        print(f"Error executing Terraform command: {e.stderr}")
        return False

    print(result.stdout)
    return True


def init_and_apply(group, variables=None):
    if not run_terraform_command(group, 'init', variables):
        return
    if not run_terraform_command(group, 'apply -auto-approve -parallelism=10', variables):
        return


def init_and_destroy(group, variables=None):
    if not run_terraform_command(group, 'init', variables):
        return
    if not run_terraform_command(group, 'destroy -auto-approve -parallelism=10', variables):
        return
