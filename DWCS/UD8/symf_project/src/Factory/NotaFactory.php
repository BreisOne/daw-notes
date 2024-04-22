<?php

namespace App\Factory;

use App\Entity\Nota;
use App\Repository\NotaRepository;
use Zenstruck\Foundry\ModelFactory;
use Zenstruck\Foundry\Proxy;
use Zenstruck\Foundry\RepositoryProxy;

/**
 * @extends ModelFactory<Nota>
 *
 * @method        Nota|Proxy                     create(array|callable $attributes = [])
 * @method static Nota|Proxy                     createOne(array $attributes = [])
 * @method static Nota|Proxy                     find(object|array|mixed $criteria)
 * @method static Nota|Proxy                     findOrCreate(array $attributes)
 * @method static Nota|Proxy                     first(string $sortedField = 'id')
 * @method static Nota|Proxy                     last(string $sortedField = 'id')
 * @method static Nota|Proxy                     random(array $attributes = [])
 * @method static Nota|Proxy                     randomOrCreate(array $attributes = [])
 * @method static NotaRepository|RepositoryProxy repository()
 * @method static Nota[]|Proxy[]                 all()
 * @method static Nota[]|Proxy[]                 createMany(int $number, array|callable $attributes = [])
 * @method static Nota[]|Proxy[]                 createSequence(iterable|callable $sequence)
 * @method static Nota[]|Proxy[]                 findBy(array $attributes)
 * @method static Nota[]|Proxy[]                 randomRange(int $min, int $max, array $attributes = [])
 * @method static Nota[]|Proxy[]                 randomSet(int $number, array $attributes = [])
 */
final class NotaFactory extends ModelFactory
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
            'description' => self::faker()->text(255),
            'titulo' => self::faker()->text(50),
        ];
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
     */
    protected function initialize(): self
    {
        return $this
            // ->afterInstantiate(function(Nota $nota): void {})
        ;
    }

    protected static function getClass(): string
    {
        return Nota::class;
    }
}
