package config

import (
	"time"
)

type Config struct {
	MinRacesCount   int
	InitialRating   float64
	FirstSeasonDate time.Time
	Elo             ConfigElo
}

type ConfigElo struct {
	D float64
	K float64
}

func (c *Config) GetSeason() int {
	return c.GetSeasonAt(time.Now())
}

func (c *Config) IsCompetitionActive() bool {
	return c.IsCompetitionActiveAt(time.Now())
}

func (c *Config) GetCompetitionEndDate() time.Time {
	return c.GetCompetitionEndDateAt(time.Now())
}

func (c *Config) GetNextSeasonStartDate() time.Time {
	return c.GetNextSeasonStartDateAt(time.Now())
}

func (c *Config) GetStartDate(season int) time.Time {
	firstOfMonth := time.Date(c.FirstSeasonDate.Year(), c.FirstSeasonDate.Month(), 1, 0, 0, 0, 0, time.UTC)
	startDate := firstOfMonth.AddDate(0, season, 0)
	return startDate
}

func (c *Config) GetSeasonAt(date time.Time) int {
	startMonth, startYear := c.FirstSeasonDate.Month(), c.FirstSeasonDate.Year()
	currentMonth, currentYear := date.Month(), date.Year()
	diffYear := (currentYear - startYear) * 12
	diffMonth := currentMonth - startMonth
	return diffYear + int(diffMonth) + 1
}

func (c *Config) IsCompetitionActiveAt(date time.Time) bool {
	return true
}

func (c *Config) GetCompetitionEndDateAt(date time.Time) time.Time {
	firstOfMonth := time.Date(date.Year(), date.Month(), 1, 23, 59, 59, 0, time.UTC)
	lastOfMonth := firstOfMonth.AddDate(0, 1, -1)
	return lastOfMonth
}

func (c *Config) GetNextSeasonStartDateAt(date time.Time) time.Time {
	firstOfMonth := time.Date(date.Year(), date.Month(), 1, 0, 0, 0, 0, time.UTC)
	firstOfNextMonth := firstOfMonth.AddDate(0, 1, 0)
	return firstOfNextMonth
}

func (c *Config) GetSecondsSinceFirstAt(date time.Time) int {
	return int(date.Unix() - c.FirstSeasonDate.Unix())
}
