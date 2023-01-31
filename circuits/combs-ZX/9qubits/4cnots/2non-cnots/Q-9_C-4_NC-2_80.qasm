OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[0];
cx q[7], q[1];
cx q[7], q[2];
x q[7];
x q[0];
cx q[5], q[6];
