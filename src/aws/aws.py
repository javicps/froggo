import subprocess
import os

TERRAFORM_DIR = os.path.join(os.path.dirname(__file__), "../commands/{group}/terraform")


def run_terraform_command(group, command):
    try:
        result = subprocess.run(
            ["terraform", command],
            cwd=TERRAFORM_DIR.format(group=group),
            capture_output=True,
            text=True,
            check=True,
        )
    except Exception as e:
        print(f"Error executing Terraform command: {e.stderr}")
        return False
    print(result.stdout)
