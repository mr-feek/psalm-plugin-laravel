Feature: Phpstorm Generic Support

  Background:
    Given I have the following config
      """
      <?xml version="1.0"?>
      <psalm totallyTyped="true" allowPhpStormGenerics="true">
        <projectFiles>
          <directory name="."/>
          <ignoreFiles> <directory name="../../vendor"/> </ignoreFiles>
        </projectFiles>
        <plugins>
          <pluginClass class="Psalm\LaravelPlugin\Plugin"/>
        </plugins>
      </psalm>
      """

  Scenario: Phpstorm substitution works for Collections
    Given I have the following code
    """
    <?php declare(strict_types=1);

    use Illuminate\Support\Collection;

    final class CollectionTypes
    {
        /**
        * @return string[]|Collection
        */
        public function get(): Collection
        {
          return new Collection(['hi']);
        }
    }
    """
    When I run Psalm
    Then I see no errors
