from __future__ import annotations

import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]


class TestScaffold(unittest.TestCase):
    def test_required_files_exist(self) -> None:
        required = [
            ROOT / "README.md",
            ROOT / "LICENSE",
            ROOT / "Makefile",
            ROOT / "docs" / "cost-safety.md",
            ROOT / "docs" / "root-vs-iam.md",
            ROOT / "examples" / "iam" / "book1_reader_s3_policy.json",
            ROOT / "scripts" / "check_env.sh",
            ROOT / "tests" / "test_scaffold.py",
        ]
        for path in required:
            self.assertTrue(path.exists(), f"Missing required file: {path.relative_to(ROOT)}")

    def test_policy_json_is_valid(self) -> None:
        path = ROOT / "examples" / "iam" / "book1_reader_s3_policy.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        self.assertIn("Version", data)
        self.assertIn("Statement", data)
        self.assertTrue(isinstance(data["Statement"], list))
        self.assertGreater(len(data["Statement"]), 0)


if __name__ == "__main__":
    unittest.main()
