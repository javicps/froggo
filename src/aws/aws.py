import subprocess
import os

TERRAFORM_DIR = os.path.join(os.path.dirname(__file__), "../commands/{group}/terraform")


def run_terraform_command(group, command):
    command_list = ["terraform"] + command.split()
    print(f"Running: {' '.join(command_list)} in {TERRAFORM_DIR.format(group=group)}")

    try:
        result = subprocess.run(command_list, cwd=TERRAFORM_DIR.format(group=group), capture_output=True, text=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing Terraform command: {e.stderr}")
        return False
    except Exception as e:
        print(f"Error executing Terraform command: {e.stderr}")
        return False
    print(result.stdout)
    return True
