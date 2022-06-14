import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const fabric = await prisma.fabric.findMany({
        include: {
            retailer: true,
            fabrictype: true,
            fabricimage: true,
        },
    });
    res.json(fabric);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const fabric = await prisma.fabric.findUnique({
        where: { id: Number(id) },
        include: {
            retailer: true,
            fabrictype: true,
            fabricimage: true,
        },
    });
    if (fabric !== null) {
        res.json(fabric);
    } else {
        res.status(404).json({ message: 'No fabric found' });
    }
});

router.post('/', async (req, res) => {
    const {
        retailerid,
        userid,
        name,
        url,
        priceperyard,
        yardsinstock,
        fabrictypeid,
        notes,
    } = req.body;
    try {
        const result = await prisma.fabric.create({
            data: {
                retailerid,
                userid,
                name,
                url,
                priceperyard,
                yardsinstock,
                fabrictypeid,
                notes,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const {
        retailerid,
        userid,
        name,
        url,
        priceperyard,
        yardsinstock,
        fabrictypeid,
        notes,
    } = req.body;
    try {
        await prisma.fabric.update({
            data: {
                retailerid,
                userid,
                name,
                url,
                priceperyard,
                yardsinstock,
                fabrictypeid,
                notes,
            },
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.fabric.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
