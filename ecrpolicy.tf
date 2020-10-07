resource "aws_ecr_repository_policy" "ecrRepoIsPublic" {
  repository = "some-Repo-Name"

  policy = "{\"Statement\":[{\"Action\":[\"*\"],\"Effect\":\"Allow\",\"Principal\":\"*\",\"Sid\":\"new policy\"}],\"Version\":\"2008-10-17\"}"
}