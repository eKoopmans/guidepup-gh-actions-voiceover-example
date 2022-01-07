/* eslint-disable no-empty-pattern */
import { exec } from "child_process";
import { test as base } from "@playwright/test";
import { VoiceOver, macOSActivate } from "@guidepup/guidepup";

const PLAYWRIGHT_APPLICATION = "Playwright";

const test = base.extend<{ vo: VoiceOver }>({
  vo: async ({}, use) => {
    const vo = new VoiceOver();

    try {
      await vo.start();
      await macOSActivate(PLAYWRIGHT_APPLICATION);
      await use(vo);
    } finally {
      await new Promise<void>((resolve) => {
        exec(
          "mkdir -p ./test-results && screencapture ./test-results/failure.png",
          () => resolve()
        );
      });

      vo.stopLog();
      await vo.stop();
    }
  },
});

export default test;
