package main

type Principal struct {
	username string `json:username`
}

type PermissionType string

const ( Sunday, Monday ) PermissionType = "value"

type Permission struct {
	permission_type PermissionType `json:type`
}
