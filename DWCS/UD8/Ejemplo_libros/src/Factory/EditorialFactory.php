<?php

namespace App\Factory;

use App\Entity\Editorial;
use App\Repository\EditorialRepository;
use Zenstruck\Foundry\ModelFactory;
use Zenstruck\Foundry\Proxy;
use Zenstruck\Foundry\RepositoryProxy;

/**
 * @extends ModelFactory<Editorial>
 *
 * @method        Editorial|Proxy                     create(array|callable $attributes = [])
 * @method static Editorial|Proxy                     createOne(array $attributes = [])
 * @method static Editorial|Proxy                     find(object|array|mixed $criteria)
 * @method static Editorial|Proxy                     findOrCreate(array $attributes)
 * @method static Editorial|Proxy                     first(string $sortedField = 'id')
 * @method static Editorial|Proxy                     last(string $sortedField = 'id')
 * @method static Editorial|Proxy                     random(array $attributes = [])
 * @method static Editorial|Proxy                     randomOrCreate(array $attributes = [])
 * @method static EditorialRepository|RepositoryProxy repository()
 * @method static Editorial[]|Proxy[]                 all()
 * @method static Editorial[]|Proxy[]                 createMany(int $number, array|callable $attributes = [])
 * @method static Editorial[]|Proxy[]                 createSequence(iterable|callable $sequence)
 * @method static Editorial[]|Proxy[]                 findBy(array $attributes)
 * @method static Editorial[]|Proxy[]                 randomRange(int $min, int $max, array $attributes = [])
 * @method static Editorial[]|Proxy[]                 randomSet(int $number, array $attributes = [])
 */
final class EditorialFactory extends ModelFactory
{
    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#factories-as-services
     *
     * @todo inject services if required
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#model-factories
     *
     * @todo add your default values here
     */
    protected function getDefaults(): array
    {
        return [
            'nombre' => self::faker()->text(255),
        ];
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
     */
    protected function initialize(): self
    {
        return $this
            // ->afterInstantiate(function(Editorial $editorial): void {})
        ;
    }

    protected static function getClass(): string
    {
        return Editorial::class;
    }
}
