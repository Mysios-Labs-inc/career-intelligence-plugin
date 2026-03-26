#!/bin/bash

# 🚀 Claude Jobseeking Plugin Release Script
# Automates version tagging and marketplace updates

set -e  # Exit on any error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if version argument is provided
if [ $# -eq 0 ]; then
    print_error "Version number required!"
    echo "Usage: $0 <version> [release-notes]"
    echo "Examples:"
    echo "  $0 1.0.1 'Bug fixes and performance improvements'"
    echo "  $0 1.1.0 'Added new document upload feature'"
    echo "  $0 2.0.0 'Major redesign with breaking changes'"
    exit 1
fi

VERSION=$1
RELEASE_NOTES=${2:-"Version $VERSION release"}

# Validate version format (basic check)
if [[ ! $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    print_error "Invalid version format. Use semantic versioning (e.g., 1.0.1)"
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "Not in a git repository!"
    exit 1
fi

# Check if working directory is clean
if ! git diff-index --quiet HEAD --; then
    print_error "Working directory has uncommitted changes!"
    echo "Please commit or stash changes before creating a release."
    exit 1
fi

# Check if we're on main branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    print_warning "Not on main branch (currently on: $CURRENT_BRANCH)"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Check if tag already exists
if git tag --list | grep -q "^v$VERSION$"; then
    print_error "Tag v$VERSION already exists!"
    exit 1
fi

print_status "Preparing release v$VERSION..."

# Pull latest changes
print_status "Pulling latest changes from remote..."
git pull origin main

# Update package.json version
if [ -f "package.json" ]; then
    print_status "Updating package.json version..."
    # Use node to update package.json version
    node -e "
        const fs = require('fs');
        const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
        pkg.version = '$VERSION';
        fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
    "

    # Commit the version update
    git add package.json
    git commit -m "🔖 Bump version to $VERSION

Preparing for release with updated package version.

Co-Authored-By: Claude Sonnet 4 <noreply@anthropic.com>"

    print_success "Updated package.json to version $VERSION"
fi

# Create and push tag
print_status "Creating release tag v$VERSION..."
git tag "v$VERSION" -m "🚀 Release v$VERSION

✨ Release Notes:
$RELEASE_NOTES

🎯 Features:
- Profile-driven automation with document upload
- Instant resume generation with job optimization
- Professional workspace organization
- Encrypted profile storage and management

🔧 Installation:
/plugin marketplace add Mysios-Labs-inc/claude-plugins-marketplace
/plugin install jobseeking-plugin@mysios-labs

📦 Package: https://github.com/Mysios-Labs-inc/claude-jobseeking-plugin/releases/tag/v$VERSION

🤖 Automated marketplace update will trigger shortly.

Co-Authored-By: Claude Sonnet 4 <noreply@anthropic.com>"

print_status "Pushing tag to remote repository..."
git push origin main
git push --tags

print_success "✅ Release v$VERSION created successfully!"
print_status "🎪 GitHub Action will automatically update the marketplace..."

# Give user next steps
echo ""
echo "🎯 What happens next:"
echo "  1. GitHub Action updates marketplace.json (1-2 minutes)"
echo "  2. Users receive update notification in Claude Code"
echo "  3. Users can update with: /plugin marketplace update"
echo ""
echo "🔗 Monitor progress:"
echo "  • GitHub Actions: https://github.com/Mysios-Labs-inc/claude-jobseeking-plugin/actions"
echo "  • Marketplace: https://github.com/Mysios-Labs-inc/claude-plugins-marketplace"
echo ""
print_success "Release automation complete! 🚀"