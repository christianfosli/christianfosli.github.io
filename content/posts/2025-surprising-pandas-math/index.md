+++
title = "Surprising arithmetics with pd.Timedelta and datetime.datetime"
date = "2025-12-03"

[extra]
comment = true

[taxonomies]
tags=["python"]
+++

In my current client project I'm working a lot with time series data in pandas.
Several nordic power markets recently changed from hourly to 15min delivery resolution,
which required me to resample pandas dataframes between the two resolutions and do some related datetime math in various situations.

While working on this, I learned about a pretty surprising Pandas (or Python, depending on who you ask) bug.
Here's a code snippet to illustrate:

```python
from datetime import datetime, timedelta, timezone

import pandas as pd

dt = datetime(2025, 9, 10, 23, 0, 0, tzinfo=timezone.utc)

print(dt - pd.Timedelta(hours=1))  # 2025-09-10 22:00:00+00:00
print(dt - pd.Timedelta(pd.tseries.offsets.Hour(1)))  # 2025-09-10 23:00:00+00:00
```

The details are available on [GitHub pandas-dev/pandas#53643](https://github.com/pandas-dev/pandas/issues/53643).

**TLDR**:

Do not mix Python stdlib's `datetime.datetime` and `pd.Timedelta` objects.

Even though `pd.Timedelta` is a subclass of Python stdlib's `datetime.datetime` they do not behave the same way and datetime arithmetics are often wrong.
