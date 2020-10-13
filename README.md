# Command-line Interface Action for cloud.gov

This is a re-usable action for use in continuous deployment workflows
using GitHub Actions, to allow automatic management of a deployment in
cloud.gov (or another Cloud Foundry instance).

## Basic usage

The simplest use of this action is to deploy using an existing manifest. Given
a username and password (which should be stored as secrets), the default
behavior of the action is to log in using the Cloud Foundry CLI and
run `cf push`.

```yaml
    - name: Deploy
      uses: usds/cloud-gov-cli
      with:
        org: ${{secrets.CF_ORG}}
        user: ${{secrets.SERVICE_USER}}
        password: ${{secrets.SERVICE_AUTH}}
```

## Advanced usage

If desired, this action can run most CF CLI commands. The list of accepted
inputs below may or may not be exhaustive--see the `inputs` section of the 
[action definition](./action.yml) to be sure you have seen them all.

* `command`: the cf-cli subcommand you wish to run. Default: `push`.
* `application`: the name of the application as deployed to cloud.gov.
  If there is only one application in your manifest, this may not be needed (but some sub-commands require it in all cases).
* `user`: **(required)**: The username to authenticate with. Should be a service
  user, not an actual human.
* `password` **(required)**: the password to authenticate with. Should be the
  password for a service user, not your actual password!
* `manifest`: the location for the manifest file for this application (default: `./manifest.yml`)
* `org`: the Cloud Foundry organization that will be targeted by this deploy.
* `space`: the Cloud Foundry space that will be targeted by this deploy.
* `api`: the Cloud Foundry API server to address 
  (default: `https://api.fr.cloud.gov`)
