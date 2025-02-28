package config

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"time"
)

func TestGetSeasonAt(t *testing.T) {
	{
		type testCase struct {
			name           string
			config         Config
			now            time.Time
			expectedSeason int
		}
		var testCases = []testCase{
			{
				name: "first season",
				now:  time.Date(2000, time.January, 1, 0, 0, 0, 0, time.Local),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.January, 1, 0, 0, 0, 0, time.Local),
				},
				expectedSeason: 1,
			},
			{
				name: "6th season, same year",
				now:  time.Date(2000, time.June, 20, 0, 0, 0, 0, time.Local),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.January, 25, 0, 0, 0, 0, time.Local),
				},
				expectedSeason: 6,
			},
			{
				name: "7th season, different year",
				now:  time.Date(2001, time.April, 15, 0, 0, 0, 0, time.Local),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.October, 17, 0, 0, 0, 0, time.Local),
				},
				expectedSeason: 7,
			},
			{
				name: "multiple years",
				now:  time.Date(2003, time.April, 15, 0, 0, 0, 0, time.Local),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.October, 17, 0, 0, 0, 0, time.Local),
				},
				expectedSeason: 7 + 24,
			},
		}

		for _, tc := range testCases {
			t.Run(tc.name, func(t *testing.T) {
				actualSeason := tc.config.GetSeasonAt(tc.now)
				assert.Equal(t, tc.expectedSeason, actualSeason)
			})
		}
	}
}

func TestGetCompetitionEndDateAt(t *testing.T) {
	{
		type testCase struct {
			name                string
			config              Config
			now                 time.Time
			expectedEndOfSeason time.Time
		}
		var testCases = []testCase{
			{
				name: "end of month",
				now:  time.Date(2000, time.January, 1, 0, 0, 0, 0, time.UTC),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.January, 1, 0, 0, 0, 0, time.UTC),
				},
				expectedEndOfSeason: time.Date(2000, time.January, 31, 23, 59, 59, 0, time.UTC),
			},
			{
				name: "very end of year",
				now:  time.Date(2000, time.December, 31, 23, 59, 59, 0, time.UTC),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.January, 1, 0, 0, 0, 0, time.UTC),
				},
				expectedEndOfSeason: time.Date(2000, time.December, 31, 23, 59, 59, 0, time.UTC),
			},
		}

		for _, tc := range testCases {
			t.Run(tc.name, func(t *testing.T) {
				actualSeason := tc.config.GetCompetitionEndDateAt(tc.now)
				assert.EqualValues(t, tc.expectedEndOfSeason, actualSeason)
			})
		}
	}
}

func TestGetNextSeasonStartDateAt(t *testing.T) {
	{
		type testCase struct {
			name                    string
			config                  Config
			now                     time.Time
			expectedNextSeasonStart time.Time
		}
		var testCases = []testCase{
			{
				name: "next month",
				now:  time.Date(2000, time.January, 1, 0, 0, 0, 0, time.UTC),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.January, 1, 0, 0, 0, 0, time.UTC),
				},
				expectedNextSeasonStart: time.Date(2000, time.February, 1, 0, 0, 0, 0, time.UTC),
			},
			{
				name: "next year",
				now:  time.Date(2000, time.December, 31, 23, 59, 59, 0, time.UTC),
				config: Config{
					FirstSeasonDate: time.Date(2000, time.January, 1, 0, 0, 0, 0, time.UTC),
				},
				expectedNextSeasonStart: time.Date(2001, time.January, 1, 0, 0, 0, 0, time.UTC),
			},
		}

		for _, tc := range testCases {
			t.Run(tc.name, func(t *testing.T) {
				actualSeason := tc.config.GetNextSeasonStartDateAt(tc.now)
				assert.EqualValues(t, tc.expectedNextSeasonStart, actualSeason)
			})
		}
	}
}
