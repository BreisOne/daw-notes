<?php

namespace App\Factory;

use App\Entity\Libro;
use App\Repository\LibroRepository;
use Zenstruck\Foundry\ModelFactory;
use Zenstruck\Foundry\Proxy;
use Zenstruck\Foundry\RepositoryProxy;

/**
 * @extends ModelFactory<Libro>
 *
 * @method        Libro|Proxy                     create(array|callable $attributes = [])
 * @method static Libro|Proxy                     createOne(array $attributes = [])
 * @method static Libro|Proxy                     find(object|array|mixed $criteria)
 * @method static Libro|Proxy                     findOrCreate(array $attributes)
 * @method static Libro|Proxy                     first(string $sortedField = 'id')
 * @method static Libro|Proxy                     last(string $sortedField = 'id')
 * @method static Libro|Proxy                     random(array $attributes = [])
 * @method static Libro|Proxy                     randomOrCreate(array $attributes = [])
 * @method static LibroRepository|RepositoryProxy repository()
 * @method static Libro[]|Proxy[]                 all()
 * @method static Libro[]|Proxy[]                 createMany(int $number, array|callable $attributes = [])
 * @method static Libro[]|Proxy[]                 createSequence(iterable|callable $sequence)
 * @method static Libro[]|Proxy[]                 findBy(array $attributes)
 * @method static Libro[]|Proxy[]                 randomRange(int $min, int $max, array $attributes = [])
 * @method static Libro[]|Proxy[]                 randomSet(int $number, array $attributes = [])
 */
final class LibroFactory extends ModelFactory
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
            'titulo' => self::faker()->text(200),
        ];
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
     */
    protected function initialize(): self
    {
        return $this
            // ->afterInstantiate(function(Libro $libro): void {})
        ;
    }

    protected static function getClass(): string
    {
        return Libro::class;
    }
}
