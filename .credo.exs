%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ~w{config lib test}
      },
      strict: true,
      color: true,
      checks: [
        {Credo.Check.Readibility.ModuleDoc, false},
        {Credo.Check.Readibility.MaxLineLength, priority: :low, max_length: 100},
        {Credo.Check.Consistency.TabsOrSpaces},
        {Credo.Check.Design.TagTODO, exit_status: 2},
        {Credo.Check.Refactor.MapInto, false},
        {Credo.Check.Warning.LazyLogging, false}
      ]
    }
  ]
}
