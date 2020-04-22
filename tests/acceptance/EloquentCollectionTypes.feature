Feature: Eloquent Collection Types
  Illuminate\Database\Eloquent\Collection has type support

  Background:
    Given I have the following config
      """
      <?xml version="1.0"?>
      <psalm totallyTyped="true">
        <projectFiles>
          <directory name="."/>
          <ignoreFiles> <directory name="../../vendor"/> </ignoreFiles>
        </projectFiles>
        <plugins>
          <pluginClass class="Psalm\LaravelPlugin\Plugin"/>
        </plugins>
      </psalm>
      """

  Scenario:
    Given I have the following code
    """
    <?php declare(strict_types=1);

    class User extends \Illuminate\Database\Eloquent\Model {
      protected $table = 'users';
    };

    final class UserRepository
    {
        /**
        * @psalm-return \Illuminate\Database\Eloquent\Collection<User>
        */
        public function getAll(): \Illuminate\Database\Eloquent\Collection
        {
          return User::all();
        }
    }
    """
    When I run Psalm
    Then I see no errors
