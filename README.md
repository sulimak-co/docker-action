# docker-action
Github action for build and push image

## Example
```yaml
    - name: Build image and Push to ghcr
            uses: sulimak-co/docker-action@1.0.0
            with:
              repository: sulimak-co/docker-actions
              username: ${{ github.repository_owner }}}
              password: ${{ secrets.PERSONAL_ACCESS_TOKEN_ORG }}
              registry: ghcr.io
              tag: ${{ env.GITHUB_BRANCH_NAME }}
```

## Arguments
| Name        |    Required        | Description  |
| ------------- |:-------------:| -----|
| username      | Yes           | Registry username |
| password      | Yes           |   Registry password |
| repository    | Yes           |    Repository on registry |
| registry     | Yes           |    Registry hostname |
| tag          | Yes           |    Image tag |
| version      | No           |    Version for sulimak-co services |