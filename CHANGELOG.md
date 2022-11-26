# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- `sshd`: no longer accept RSA keys < 2048 bits for authentication

## [1.0.0] - 2020-07-24
### Fixed
- empty passwords (redundant as sshd config disables password authentication)
- pin package versions

## [0.1.0] - 2019-01-01
### Added
- openssh server
- client restricted to `rsync --server` command via `rrsync`
- `rrsync` "chroots" to `/data`

[Unreleased]: https://github.com/fphammerle/docker-rsync-sshd/compare/v1.0.0...master
[1.0.0]: https://github.com/fphammerle/docker-rsync-sshd/compare/0.1-amd64...v1.0.0
[0.1.0]: https://github.com/fphammerle/docker-rsync-sshd/tree/0.1-amd64
