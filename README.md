# circleci-voiceover-example

An example demonstrating using Guidepup for testing VoiceOver automation with [Playwright](https://playwright.dev/) in CircleCI.

Run this example's test with:

```bash
yarn install --frozen-lockfile
yarn test
```

> Note: please ensure you have setup the [VoiceOver prerequisites](https://github.com/guidepup/guidepup/blob/main/guides/voiceover-prerequisites/README.md) before running this example.

## Test flow

1. The test launches Safari using Playwright
2. Navigates to the Playwright website
3. Moves through the website using VoiceOver controlled by Guidepup to the search input
4. Searches for Safari
5. Moves to the Webkit section of the docs

## How it works

This module makes use of [`@guidepup/playwright`](https://github.com/guidepup/guidepup-playwright) for seamless Guidepup integration with Playwright.
