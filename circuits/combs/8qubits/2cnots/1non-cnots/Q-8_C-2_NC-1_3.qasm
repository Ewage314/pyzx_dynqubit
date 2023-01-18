OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[7], q[0];
x q[2];
cx q[7], q[5];
