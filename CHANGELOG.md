# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Security

- Base the image on `atmoz/sftp:debian`, which upstream rebuilds daily, instead of `atmoz/sftp:latest`, which has not been updated since July 2024 and ships outdated OpenSSH and Debian packages.
