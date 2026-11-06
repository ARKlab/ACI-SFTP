# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.3] - 2026-11-06

### Security

- Base the image on `atmoz/sftp:debian`, which upstream rebuilds daily, instead of `atmoz/sftp:latest`, which has not been updated since July 2024 and ships outdated OpenSSH and Debian packages.

[Unreleased]: https://github.com/ARKlab/ACI-SFTP/compare/v1.1.3...HEAD
[1.1.3]: https://github.com/ARKlab/ACI-SFTP/compare/v1.1.2...v1.1.3
