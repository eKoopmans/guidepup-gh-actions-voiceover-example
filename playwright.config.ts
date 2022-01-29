import { PlaywrightTestConfig, devices } from "@playwright/test";
import { voConfig } from "@guidepup/playwright";

const config: PlaywrightTestConfig = {
  ...voConfig,
  reportSlowTests: null,
  timeout: 2 * 60 * 1000,
  projects: [{ use: devices["Desktop Safari"] }],
};

export default config;
