from __future__ import annotations

from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]


class TestBook1Contract(unittest.TestCase):
    def test_new_docs_exist(self) -> None:
        required = [
            ROOT / "docs" / "account-setup-checklist.md",
            ROOT / "docs" / "verify.md",
            ROOT / "docs" / "walkthrough-plan.md",
            ROOT / "scripts" / "check_aws_cli.sh",
            ROOT / "scripts" / "s3_smoke.sh",
        ]
        for path in required:
            self.assertTrue(path.exists(), f"Missing required file: {path.relative_to(ROOT)}")

    def test_s3_smoke_mentions_both_modes(self) -> None:
        text = (ROOT / "scripts" / "s3_smoke.sh").read_text(encoding="utf-8")
        self.assertIn("--plan", text)
        self.assertIn("--execute", text)

    def test_readme_mentions_named_profile(self) -> None:
        text = (ROOT / "README.md").read_text(encoding="utf-8").lower()
        self.assertIn("named", text)
        self.assertIn("profile", text)


if __name__ == "__main__":
    unittest.main()
