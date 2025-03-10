import click

@click.group()
def cli():
    """CLI tool to provision a database using Terraform"""
    pass

@click.command()
@click.argument("command")
def db(command):
    """Provision Aurora Databases for development"""

    match command:
        case "up":
            click.echo(f'Provisioning a new DB!')
        case "down":
            click.echo(f'Destroying the DB!')
        case "status":
            click.echo(f'Status for DB')

    pass

@click.command()
def up():
    """Provisions an Aurora DB for development."""
    click.echo(f'Provisioning for!')

@click.command()
def down():
    """Destroys Aurora database"""
    click.echo(f'Destroying db!')




cli.add_command(db)



if __name__ == '__main__':
    cli()
